import React, { Component } from "react";
import { Progress } from "antd";

import { dispatchUrl } from "../services.js";

const { Socket } = require("phoenix-channels");

export default class ProgressPoller extends Component {
  componentDidMount() {
    let socket = new Socket(`ws://${dispatchUrl}/socket`);
    socket.connect();
    let channel = socket.channel(`progress:1`);

    channel
      .join()
      .receive("ok", res => console.log("Connected to Progress Poller", res));

    channel.on("change", payload => this._updateProgressData(payload));
  }

  state = {
    progress: 0
  };

  _updateProgressData = payload => this.setState({ progress: payload.value });

  render() {
    if (this.state.progress !== 100) {
      return (
        <Progress
          percent={this.state.progress}
          status={this.state.progress !== 100 ? "active" : ""}
        />
      );
    }
    return <Progress percent={this.state.progress} />;
  }
}
