package dbreplica

import (
	"fmt"
	"github.com/jinzhu/gorm"
	"strings"
)

// ExportQueries execute all the extraction queries to create a copy of database with only the users specific data.
func ExportQueries(db *gorm.DB, dest string, userID string) {

	//Testing database connection
	querys := []string{
		// export version:  users
		`INSERT INTO users(id,email, password_hash,first_name,last_name,permission_level) SELECT * FROM dblink( ` + dest +
			`,'SELECT * FROM users where users.id = ` + userID +
			`' ) AS users(id int4, email varchar, password_hash varchar, first_name varchar, last_name varchar, permission_level int2)`,
		// export version: settings
		`INSERT INTO settings(id,user_id) SELECT * FROM dblink(` + dest +
			`, 'SELECT * FROM settings where user_id=` + userID +
			`' )AS settings(id int4, user_id int8)`,
		// export: organisation
		`INSERT INTO organisations(id,name,logo,three_words) SELECT * FROM dblink(` + dest +
			`,'select distinct organisations.* from teams,coaches,organisations where teams.id = coaches.team_id ` +
			`and coaches.user_id = ` + userID +
			`and teams.organisation_id = organisations.id') AS organisations(id int8, name varchar, logo varchar, three_words _text);`,
		// export version: teams
		`INSERT INTO teams(id,name,type,color,logo,organisation_id) SELECT * FROM dblink(` + dest +
			`, 'select distinct teams.* from teams,coaches where teams.id = coaches.team_id AND coaches.user_id = ` + userID +
			`' ) AS teams(id int8,name varchar,type varchar,color varchar,logo varchar,organisation_id int8)`,
		// export version: players all the players of team the user is a coach (forced on relation players.user_id)
		`INSERT INTO players(id,first_name,last_name,weight,height, position, img,number,user_id) SELECT * FROM dblink(` + dest +
			`, 'select distinct(players.*) from players,teams,player_team where players.id = player_team.player_id and ` +
			`player_team.team_id  IN (select distinct teams.id from teams,coaches where teams.id = coaches.team_id AND coaches.user_id = ` + userID +
			`)') AS players(id int8, first_name varchar, last_name varchar, weight float8, height float8, position varchar, img varchar, number int4,user_id int4);`,
		// export version: coaches
		`INSERT INTO coaches(id,user_id,team_id) SELECT * FROM dblink(` + dest +
			`, 'SELECT * FROM coaches where user_id=` + userID +
			`') AS setting(id int4, user_id int8,team_id int8);`,
		// export version: pitches
		`INSERT INTO pitches(id,name,dimensions,geo_fence,type ,organisation_id) SELECT * FROM dblink(` + dest +
			`,'select distinct pitches.* from teams,coaches,organisations,pitches where teams.id = coaches.team_id AND coaches.user_id =` + userID +
			` and teams.organisation_id = organisations.id and pitches.organisation_id = organisations.id;')` +
			` AS pitches(id int4,name varchar,dimensions jsonb,geo_fence jsonb,type int2 ,organisation_id int8);`,
		// export version: anchors
		`INSERT INTO anchors(id,x,y,z,pitch_id)SELECT * FROM dblink(` + dest +
			`, 'select distinct anchors.* from teams,coaches,organisations,pitches,anchors where teams.id = coaches.team_id AND coaches.user_id =` + userID +
			`and teams.organisation_id = organisations.id and pitches.organisation_id = organisations.id and pitches.id = anchors.pitch_id;')` +
			` AS anchors(id int4,x float4,y float4,z float4,pitch_id int4);`,
		// export version: tags
		`INSERT INTO tags(id,type,calibration) SELECT * FROM dblink(` + dest +
			`,'select distinct(tags.*) from teams,coaches,tags_teams,tags where teams.id = coaches.team_id and coaches.user_id =` + userID +
			` and tags_teams.team_id = teams.id and tags_teams.tag_id = tags.id;') AS tags(id int4,type varchar,calibration jsonb);`,
		// export version: tags_teams
		`INSERT INTO tags_teams(id,tag_id,team_id,name) SELECT * FROM dblink(` + dest +
			`, 'select distinct(tags_teams.*)from teams,coaches,tags_teams where teams.id = coaches.team_id and coaches.user_id =` + userID +
			` and tags_teams.team_id = teams.id;') AS tags_teams(id int4,tag_id int4,team_id int8,name varchar);`,
		// export version: sensors
		`INSERT INTO sensors(id,hardware_id,fields) SELECT * FROM dblink(` + dest +
			`,'select distinct(sensors.*) from teams,coaches,sensors_teams,sensors where teams.id = coaches.team_id and coaches.user_id =` + userID +
			` and sensors_teams.team_id = teams.id and sensors_teams.sensor_id = sensors.id;') AS sensors(id int4,hardware_id varchar,fields jsonb);`,
		// export version: sensors_teams
		`INSERT INTO sensors_teams(id,sensor_id,team_id,name) SELECT * FROM dblink(` + dest +
			`, 'select distinct(sensors_teams.*) from teams,coaches,sensors_teams where teams.id = coaches.team_id and coaches.user_id = ` + userID +
			` and sensors_teams.team_id = teams.id;') AS sensors_teams(id int4,sensor_id int4,team_id int8,name varchar);`,
		// export version: sessions
		`INSERT INTO sessions(id,start_time, end_time,name,video,video_offset,pitch_id) SELECT * FROM dblink(` + dest +
			`, 'select distinct sessions.*from teams,coaches,teams_sessions,sessions where teams.id = coaches.team_id and coaches.user_id = ` + userID +
			` and teams_sessions.team_id = teams.id and sessions.id = teams_sessions.session_id;')` +
			`AS sessions(id int8,start_time float8, end_time float8,name varchar,video varchar,video_offset int4,pitch_id int4);`,
		// export version: team_session
		`INSERT INTO teams_sessions(team_id,session_id) SELECT * FROM dblink(` + dest +
			`, 'select distinct teams_sessions.* from teams,players,coaches,teams_sessions where teams.id = coaches.team_id and coaches.user_id = ` + userID +
			`  and teams_sessions.team_id = teams.id;') AS teams_sessions(team_id int8,session_id int8);`,
		// export version: player_session
		`INSERT INTO players_sessions(id,player_id,session_id,tag_team_id,sensor_team_id,team_id) SELECT * FROM dblink(` + dest +
			`, 'select distinct(players_sessions.*) from teams, players, players_sessions,player_team,(select distinct sessions.* from teams,coaches,teams_sessions,sessions` +
			` where teams.id = coaches.team_id and coaches.user_id = ` + userID +
			` and teams_sessions.team_id = teams.id and sessions.id = teams_sessions.session_id) as sessions` +
			` where players.id = player_team.player_id and player_team.team_id IN (select distinct teams.id from teams,coaches ` +
			`where teams.id = coaches.team_id AND coaches.user_id = ` + userID +
			`) and players_sessions.session_id = sessions.id; ') AS players_sessions(id int8,player_id int8,session_id int8,tag_team_id int4,sensor_team_id int4, team_id int8);`,
		// export version: stats
		`INSERT INTO stats(id,player_session_id,delta_s, max_v, heatmap,kcalperkg,power_ratio,speed_bands) SELECT * FROM dblink(` + dest +
			`,'select distinct(stats.*) from teams, players,stats, players_sessions, player_team, (select distinct sessions.* ` +
			`from teams,coaches,teams_sessions,sessions where teams.id = coaches.team_id and coaches.user_id = ` + userID +
			` and teams_sessions.team_id = teams.id and sessions.id = teams_sessions.session_id) as sessions` +
			` where players.id = player_team.player_id and player_team.team_id IN (select distinct teams.id from teams,coaches` +
			` where teams.id = coaches.team_id AND coaches.user_id = ` + userID +
			` ) and players_sessions.session_id = sessions.id and stats.player_session_id = players_sessions.id;')` +
			` AS stats(id int8,player_session_id int8,delta_s float8, max_v float8, heatmap varchar,kcalperkg float8,power_ratio float8,speed_bands _int4);`,
		// export version: events
		`INSERT INTO events(id,session_id,start_time, end_time,type) SELECT * FROM dblink(` + dest +
			`,'select distinct events.* from teams,coaches,teams_sessions,sessions,events where teams.id = coaches.team_id ` +
			`and coaches.user_id = ` + userID +
			` and teams_sessions.team_id = teams.id and sessions.id = teams_sessions.session_id and sessions.id = events.session_id; ')` +
			`as events(id int8,session_id int8,start_time float8, end_time float8,type int2);`,
		// export version: flights
		`INSERT INTO flights(id,ball_id,from_id,to_id,hang_time,dist,speed, efficiency, kick, end_over_end_efficiency, type,validated, offset_x, offset_y, offset_z,` +
			`success,hit_post,max_height, spin, event_id, polynomial_coefficients) SELECT * FROM dblink(` + dest +
			`, 'select distinct flights.* from teams,coaches,teams_sessions,sessions,events,flights where teams.id = coaches.team_id AND coaches.user_id =` + userID +
			` and teams_sessions.team_id = teams.id and sessions.id = teams_sessions.session_id and sessions.id = events.session_id and events.id = flights.event_id;')` +
			`as flights(id int8,ball_id int4,from_id int4,to_id int4,hang_time float8,dist float8,speed float8, efficiency float8,` +
			`kick bool, end_over_end_efficiency float8, type int2, validated bool, offset_x float4, offset_y float4, offset_z float4,` +
			`success bool ,hit_post bool,max_height float8, spin float8, event_id int8, polynomial_coefficients _float8);`,
		// export version: scrums
		`INSERT INTO scrums(id,name,infringements,event_id) SELECT * FROM dblink(` + dest +
			`,'select distinct scrums.* from teams,coaches,teams_sessions,sessions,events,flights,scrums where teams.id = coaches.team_id AND coaches.user_id = ` + userID +
			` and teams_sessions.team_id = teams.id and sessions.id = teams_sessions.session_id and sessions.id = events.session_id and events.id = scrums.event_id;')` +
			`as scrums(id int8,name varchar,infringements jsonb,event_id int8);`,
		// export: players session scrum
		`INSERT INTO players_sessions_scrums(id,player_session_id,scrum_id,scrum_index) SELECT * FROM dblink(` + dest +
			`,'select distinct (players_sessions_scrums.*) from players,teams, players_sessions,players_sessions_scrums,player_team` +
			` where   players.id = players_sessions.player_id and players_sessions.id = players_sessions_scrums.player_session_id and` +
			` players.id = player_team.player_id and player_team.team_id IN (select distinct teams.id from teams,players,coaches` +
			` where teams.id = coaches.team_id AND coaches.user_id = ` + userID +
			` );') as players_sessions_scrums(id int4,player_session_id int8,scrum_id int8,scrum_index int4);`,
	}
	if errs := db.Exec(strings.Join(querys, ";")).GetErrors(); errs != nil {
		LogError(fmt.Errorf("%v", errs))
	}
}
