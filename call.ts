import { Injectable, EventEmitter } from "@angular/core";
import { PeerConfig } from "../../config/PeerConfig";
import { Storage } from "@ionic/storage";
import { Api } from "../api/api";
import { Logging } from "../../models/logging";
import { Endpoints } from "../../config/Endpoints";

declare var Peer;

@Injectable()
export class CallProvider {
  peer: any;
  timCounter: any;
  connectedPeers = {};
  constructor(private storage: Storage, private api: Api) {}

  initilizePeer(isStart: boolean = false): void {
    if (isStart) {
      setTimeout(() => {
        this.peer = new Peer({
          key: PeerConfig.key,
          debug: 3
        });
        this.peer.on("open", id => {
          this.storage.set("myCallId", id);
        });
        this.peer.on('error', err => console.log(err));

        this.peer.on('connection', c => {
          // Show connection when it is completely ready
          c.on('open', () => this.peerConnected(c));
        });
      }, 3000);
    }
  }

  peerConnected(c: any): any {
    console.log(c);
  }


  peerChatConnect(id: string): any {
    if (!this.connectedPeers[id]) {
      const peerConnection = this.peer.connect(id, {
        label: 'chat',
        metadata: {message: "Hi connection connected"}
      });
      peerConnection.on("open", id => {
        this.peerConnected[id] = 1;
      });
      peerConnection.on("error", err => {
        console.log(err);
      });
    }
  }

  peerVoiceConnect(id: string): any {
    let localStream = null;
    navigator.mediaDevices.getUserMedia({ video: false, audio: true }).then(stream => {
      localStream = stream;
    }).catch(err => {
      console.log(err);
    });
    
    const callConn = this.peer.call(id, localStream);
  }

  peerStartVoiceCall(): any {
    let localStream = null;
    navigator.mediaDevices.getUserMedia({ video: false, audio: true }).then(stream => {
      localStream = stream;
    }).catch(err => {
      console.log(err);
    });
    this.peer.on("call", call => {
      call.answer(localStream);
    });
  }

  initilizeVoiceCall(peerId: string) {
    const call = this.peer.call(peerId, {
      audioReceiveEnabled: true
    });
  }

  clearStorage(): Promise<any> {
    return this.storage.clear();
  }

  removeKey(keyName: string): Promise<any> {
    return new Promise((resolve, reject) => {
      this.storage.remove(keyName).then(res => {
        resolve(res);
      });
    });
  }

  getValueByKey(keyName: string): Promise<any> {
    return new Promise((resolve, reject) => {
      this.storage
        .get(keyName)
        .then(res => {
          resolve(res);
        })
        .catch(err => {
          reject(err);
        });
    });
  }

  setValueKey(keyName: string, keyValue: any): Promise<any> {
    return new Promise((resolve, reject) => {
      this.storage.set(keyName, keyValue).then(res => {
        resolve(res);
      });
    });
  }

  setLoggin(logging: Logging): Promise<any> {
    return new Promise((resolve, reject) => {
      this.api
        .post(Endpoints.api.appsettings + "v1/logging/set", logging)
        .subscribe(
          res => {
            resolve(res);
          },
          err => {
            console.log(err);
          }
        );
    });
  }

  timedownCounter(hh: number, mm: number, ss: number): void {
    let _timeCountdown = setInterval(() => {
      if (hh != 0 && mm == 0) {
        hh -= 1;
      }

      if (mm > 59) {
        mm = 59;
      }

      if (mm != 0 && ss == 0) {
        mm -= 1;
      } else if (hh >= 0 && mm == 0 && ss == 0) {
        mm = 59;
      }

      if (ss != 0 && mm >= 0) {
        ss -= 1;
      } else if (ss == 0) {
        ss = 59;
      } else {
        ss = 0;
      }
      if (hh == 0 && mm == 0 && ss == 0) {
        clearInterval(_timeCountdown);
      }
      this.timCounter = hh + ":" + mm + ":" + ss;
    }, 1000);
  }

  getDate(date: string): any {
    if (date != null) {
      let _date = new Date(parseInt(date.replace(/\//g, "").substr(5)));
      let year = _date.getFullYear();
      let month =
        _date.getMonth() < 9
          ? "0" + (parseInt(_date.getMonth().toString()) + parseInt("1"))
          : _date.getMonth() + 1;
      let day = _date.getDate() <= 9 ? "0" + _date.getDate() : _date.getDate();
      console.log(year + "-" + month + "-" + day);
      return year + "-" + month + "-" + day;
    }
    return date;
  }

  filterByKey(
    key: string,
    value: string,
    data: any[],
    action: any = "select"
  ): any {
    return data.filter(function(item, index) {
      if (action == "delete") {
        if (item[key] == value) {
          data.splice(index);
          return true;
        }
        return false;
      } else {
        return item[key] == value;
      }
    });
  }

  convertToDataURLviaCanvas(url, outputFormat): Promise<any> {
    return new Promise((resolve, reject) => {
      let img = new Image();
      img.crossOrigin = "Anonymous";
      img.onload = function() {
        let canvas = <HTMLCanvasElement>document.createElement("CANVAS"),
          ctx = canvas.getContext("2d"),
          dataURL;
        canvas.height = img.height + 10;
        canvas.width = img.width + 10;
        ctx.drawImage(img, 0, 0);
        dataURL = canvas.toDataURL(outputFormat);
        //callback(dataURL);
        canvas = null;
        resolve(dataURL);
      };
      img.src = url;
    });
  }
}
