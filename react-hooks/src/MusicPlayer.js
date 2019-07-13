import React, { useState, useEffect } from 'react';

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
  const [play, setPlay] = useState(false);

  const [currentTime, setCurrentTime] = useState(0);
  const [songIndex, setSongIndex] = useState(0);
  const song = songs[songIndex];

  const [invertedTime, setInvertedTime] = useState(false);

  useEffect(() => {
    if (play) {
      setTimeout(() => {
        if (currentTime + speed_factor < song.time) {
          setCurrentTime(currentTime + speed_factor);
        } else {
          // Order is important
          setCurrentTime(0);
          setSongIndex((songIndex + 1) % songs.length);
        }
      }, 1000);
    }
  }, [currentTime, songIndex, song.time, play]);

  return (
    <div class="music-player">
      <div class="play">
        <div>
          <button onClick={() => setPlay(!play)}>
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
          <i class="material-icons m_icons">skip_previous</i>
        </button>
        <button>
          <i class="material-icons m_icons">skip_next</i>
        </button>
      </div>
    </div>
  );
}
