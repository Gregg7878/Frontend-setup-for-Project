import React, { useState, useEffect } from 'react';
import { Switch, Route } from 'react-router-dom';
import ArticleList from './components/ArticleList';
import ArticleDetail from './components/ArticleDetail';
import ArticleForm from './components/ArticleForm';
import CommentList from './components/CommentList';
import CommentForm from './components/CommentForm';
import UserForm from './components/UserForm';
import LoginForm from './components/LoginForm';
import './styles.css';

function App() {
  const [articles, setArticles] = useState([]);

  useEffect(() => {
    fetch('/api/articles')
      .then(response => response.json())
      .then(data => setArticles(data))
      .catch(error => console.error(error));
  }, []);

  return (
    <div className="App">
      <header>
        <nav>
          <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/articles/new">New Article</a></li>
            <li><a href="/users/new">New User</a></li>
            <li><a href="/login">Login</a></li>
          </ul>
        </nav>
      </header>
      <main>
        <Switch>
          <Route exact path="/">
            <ArticleList articles={articles} />
          </Route>
          <Route exact path="/articles/new">
            <ArticleForm />
          </Route>
          <Route exact path="/articles/:id">
            <ArticleDetail />
            <CommentList />
            <CommentForm />
          </Route>
          <Route exact path="/users/new">
            <UserForm />
          </Route>
          <Route exact path="/login">
            <LoginForm />
          </Route>
        </Switch>
      </main>
    </div>
  );
}

export default App;
