import React, { useState } from 'react';

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
  const play = true;

  const song = songs[0];

  const [invertedTime, setInvertedTime] = useState(false);

  const currentTime = 30;

  return (
    <div class="music-player">
      <div class="play">
        <div>
          <button>
            {play ? (
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
              ? formatTime(currentTime)
              : '-' + formatTime(song.time - currentTime)}
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
          <i class="material-icons m_icons">skip_previous</i>
        </button>
        <button>
          <i class="material-icons m_icons">skip_next</i>
        </button>
      </div>
    </div>
  );
}
