/* eslint-disable */
import React, {
  Component,
  useState,
  useEffect,
  useRef,
  useMemo,
  useCallback
} from 'react';
import './App.css';

import MusicPlayer from './MusicPlayer.js';

function Counter() {
  const [counter, setCounter] = useState(0);
  const [enabled, setEnabled] = useState(false);

  const user = useMemo(
    () => {
      console.log('recompute');

      return {};
    },
    [enabled]
  );
  useEffect(
    () => {
      console.log('Rendered');
      setCounter(counter + 1);
    },
    [enabled, user]
  );
  console.log(user);

  return (
    <div style={{ color: 'white' }}>
      {counter}
      <button onClick={() => setEnabled(!enabled)}>
        {enabled ? 'Enabled' : 'Disabled'}
      </button>
    </div>
  );
}

function useSafeState(v) {
  const [value, setValue] = useState(v);

  const mountedRef = useRef(false);

  useEffect(() => {
    if (mountedRef.current === false) {
      mountedRef.current = true;
      console.log('Mounted');
    }

    return () => {
      console.log('Unmounted');
      mountedRef.current = false;
    };
  }, []);

  return [
    value,
    v => {
      if (mountedRef.current) {
        setValue(v);
      }
    }
  ];
}

function GithubUser() {
  const [userId, setUserId] = useState('vramana');
  const [user, setUser] = useSafeState({});
  const [userId2, setUserId2] = useState('vramana');
  const [user2, setUser2] = useSafeState({});

  const domRef = useRef(null);

  const getUser = useCallback((userId, setUser) => {
    console.log('Network Request ');

    return fetch('https://api.github.com/users/' + userId, {
      headers: {
        Authorization: 'Bearer 72d68ff415f6e9c63f9ce078530d38fb92cf84e9'
      }
    })
      .then(res => res.json())
      .then(user => setUser(user));
  }, []);

  useEffect(
    () => {
      const timeout1 = setTimeout(() => {
        getUser(userId, setUser);
      }, 1000);
      const timeout2 = setTimeout(() => {
        getUser(userId2, setUser2);
      }, 1000);

      return () => {
        clearTimeout(timeout1);
        clearTimeout(timeout2);
      };
    },
    [location.search, getUser, userId, userId2]
  );

  useEffect(() => {
    console.log(domRef.current.getBoundingClientRect());
  });

  return (
    <div ref={domRef}>
      <div>
        <input
          value={userId}
          onChange={e => {
            setUserId(e.target.value);
          }}
        />
      </div>
      <div>{user.name}</div>
      <div>{user.login}</div>
      <div>
        <input
          value={userId2}
          onChange={e => {
            setUserId2(e.target.value);
          }}
        />
      </div>
      <div>{user2.name}</div>
      <div>{user2.login}</div>
    </div>
  );
}

function App() {
  const [show, setShow] = useState(true);

  useEffect(() => {
    // setTimeout(() => {
    //   setShow(false);
    // }, 3000);
  });

  return (
    <div className="App">
      <header className="App-header">
        <GithubUser />
      </header>
    </div>
  );
}

// 1. useState Button Open and Close
//
// 2. useEffect fetch github api
//
// 3. useEffect AutoComplete
//
// 4. useEffect counter with setTimeout pause and play
//
// 5. Music Player

export default App;
