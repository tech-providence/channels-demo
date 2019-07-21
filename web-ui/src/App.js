import React from "react";
import { Button, Card, Row } from "antd";

import ProgressPoller from "./components/ProgressPoller";

import "./App.css";

const { sendRequest } = require("./utils/request");

/* eslint-disable no-unused-expressions */
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <Card title={"Progress"} style={{ width: 300 }}>
          <Row>
            <ProgressPoller />
          </Row>
          <br />
          <Row>
            <Button onClick={sendRequest}>Send</Button>
          </Row>
        </Card>
      </header>
    </div>
  );
}

export default App;
