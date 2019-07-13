import React, { useState, useEffect, useReducer } from 'react';

const speed_factor = 10;

const songs = [
  {
    title: 'Tum Hi Ho',
    time: 90
  },
  {
    title: 'My Love is Gone',
    time: 50
  },
  {
    title: 'Adhoore',
    time: 70
  },
  {
    title: 'Kabhi Kabhi Aditi',
    time: 70
  }
];

function formatTime(t) {
  const seconds = `${t % 60}`;

  return `${Math.floor(t / 60)}:${seconds < 10 ? '0' + seconds : seconds}`;
}

export default function MusicPlayer() {
  const [state, dispatch] = useReducer(
    function(state, action) {
      const { play, songIndex, currentTime } = state;
      const song = songs[songIndex];
      switch (action.type) {
        case 'PLAYING':
          if (currentTime + speed_factor < song.time) {
            return {
              ...state,
              currentTime: currentTime + speed_factor
            };
          } else {
            return {
              ...state,
              songIndex: (songIndex + 1) % songs.length,
              currentTime: 0
            };
          }

        case 'PREV':
          return {
            ...state,
            songIndex: (songIndex - 1 + songs.length) % songs.length,
            currentTime: 0
          };
        case 'NEXT':
          return {
            ...state,
            songIndex: (songIndex - 1 + songs.length) % songs.length,
            currentTime: 0
          };

        case 'TOGGLE_PLAY': {
          return {
            ...state,
            play: !play
          };
        }

        default:
          return state;
      }
    },
    {
      play: false,
      songIndex: 0,
      currentTime: 0
    }
  );

  const { play, songIndex, currentTime } = state;

  const song = songs[songIndex];

  const [invertedTime, setInvertedTime] = useState(false);

  useEffect(
    () => {
      let timeout;
      if (play) {
        timeout = setTimeout(() => {
          if (currentTime + speed_factor < song.time) {
            dispatch({ type: 'PLAYING' });
          } else {
            dispatch({ type: 'NEXT' });
          }
        }, 1000);
      }

      return () => {
        if (timeout) {
          clearTimeout(timeout);
        }
      };
    },
    [currentTime, songIndex, song.time, play]
  );

  return (
    <div class="music-player">
      <div class="play">
        <div>
          <button onClick={() => dispatch({ type: 'TOGGLE_PLAY' })}>
            {!play ? (
              <i class="material-icons m_icons">play_arrow</i>
            ) : (
              <i class="material-icons m_icons">pause</i>
            )}
          </button>
        </div>

        <div class="track">
          <div class="title">{song.title}</div>
          <div class="time" onClick={() => setInvertedTime(!invertedTime)}>
            {invertedTime
              ? '-' + formatTime(song.time - currentTime)
              : formatTime(currentTime)}
          </div>
        </div>
      </div>

      <div class="controls">
        <button>
          <i class="material-icons m_icons">repeat</i>
        </button>
        <button>
          <i class="material-icons m_icons">shuffle</i>
        </button>
        <button>
          <i
            class="material-icons m_icons"
            onClick={() => {
              dispatch({ type: 'PREV' });
            }}
          >
            skip_previous
          </i>
        </button>
        <button>
          <i
            class="material-icons m_icons"
            onClick={() => {
              dispatch({ type: 'NEXT' });
            }}
          >
            skip_next
          </i>
        </button>
      </div>
    </div>
  );
}
