var level1_json = @'
{
  "song": "music_song",
  "notes": [
    {
      "key": "up",
      "time": 2.3
    },
    {
      "key": "up",
      "time": 3.76
    },
    {
      "key": "down",
      "time": 4.9
    },
    {
      "key": "up",
      "time": 6.1
    },
    {
      "key": "down",
      "time": 7.36
    },
    {
      "key": "down",
      "time": 8.45
    },
    {
      "key": "up",
      "time": 9.6
    },
    {
      "key": "down",
      "time": 10.86
    },
	 {
      "key": "up",
      "time": 12.03
    },
    {
      "key": "down",
      "time": 12.68
    },
    {
      "key": "up",
      "time": 13.86
    },
    {
      "key": "down",
      "time": 15.58
    },
    {
      "key": "up",
      "time": 16.81
    },
    {
      "key": "down",
      "time": 17.93
    }
  ]
}
';

enum GameState
{
    COUNTDOWN,
    PLAYING,
    COMMENTARY,
    GAME_OVER,
    VICTORY
}


//State of Game
//game_state = "countdown";
//countdown = 3;
//countdown_timer = room_speed;
//music_started = false;
//level_finished = false;
//level_complete = false;

					
// SCORE BAR
game_state = GameState.COUNTDOWN;
score_bar = 50;
score_bar_visual = 50;
score_bar_color = c_white;
score_bar_timer = 0;

level_complete = false;


countdown = 4;
countdown_timer = room_speed;

feedback_text = "";
feedback_timer = 0;

spawn_offset = 1.5;

song_started = false;

music_instance = noone;
chart_data_lvl1 = json_parse(level1_json);
chart_index = 0;

current_level = 0;
levels = [
    {
        song: sound_lvl1,
        chart: chart_data_lvl1,
        target: 85,
        travel_time: 4
    },

    {
        song: chart_data_lvl1,
        chart: chart_data_lvl1,
        target: 85,
        travel_time: 3
    },

    {
        song: chart_data_lvl1,
        chart: chart_data_lvl1,
        target: 85,
        travel_time: 2.5,
        final_level: true
    }
];

function load_level()
{
    var data = levels[current_level];

    chart_index = 0;

    score_bar = 50;
    score_bar_visual = 50;

    level_complete = false;

    music_instance = noone;
	
	song_started = false;
	
    // Configuración del nivel
    current_song = data.song;
    current_chart = data.chart;
    current_target = data.target;
    current_travel_time = data.travel_time;
}

load_level();