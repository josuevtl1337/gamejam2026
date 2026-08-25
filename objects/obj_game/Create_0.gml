spawn_timer = 0;

feedback_text = "";
feedback_timer = 0;
notes_count = 0;

count = 0;

chart_index = 0;
spawn_offset = 1.5;

//music_instance = audio_play_sound(sound_lvl1, 1, false);
music_instance = noone;

var json = @'
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

chart_data = json_parse(json);


// UI
score_bar = 0;
score_bar_color = c_white;
score_bar_timer = 0;
score_bar_visual = 50;
score_bar_timer = 0;

//State of Game
game_state = "countdown";

countdown = 3;
countdown_timer = room_speed;

music_started = false;
level_finished = false;

level_complete = false;


audio_play_sound(snd_whistle_start, 1, false);


