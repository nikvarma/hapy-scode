import {
  Component,
  OnInit,
  AfterContentInit,
  ElementRef,
  ViewChild
} from "@angular/core";
import {
  IonicPage,
  NavController,
  NavParams,
  ViewController,
  ActionSheetController,
  PopoverController,
  ToastController
} from "ionic-angular";

import { Storage } from "@ionic/storage";
import { Observable } from "rxjs";
import { AngularFireDatabase } from "angularfire2/database";
import { InitloadProvider, CallProvider } from "../../providers";
import { CallchatmessageProvider } from "../../providers/callchatmessage/callchatmessage";

@IonicPage()
@Component({
  selector: "page-chat-box",
  templateUrl: "chat-box.html",
  providers: [CallProvider, CallchatmessageProvider]
})
export class ChatBoxPage implements OnInit, AfterContentInit {
  toUserDetails = {};
  bgImage: string;
  textempty: boolean = true;
  toId: string;
  userId: string;
  items: Observable<any[]>;
  messageId: string;
  messageTextBox: HTMLTextAreaElement;

  @ViewChild("chatboxbody", { read: ElementRef })
  chatboxbody: ElementRef;
  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    private storage: Storage,
    private viewCtrl: ViewController,
    private actionsheetCtrl: ActionSheetController,
    private popoverCtrl: PopoverController,
    private fdb: AngularFireDatabase,
    private initLoad: InitloadProvider,
    private call: CallProvider,
    private toast: ToastController,
    private callchatMessage: CallchatmessageProvider
  ) {}

  ionViewDidLoad() {
    console.log("ionViewDidLoad ChatBoxPage");
  }

  closeChatBox(): void {
    this.viewCtrl.dismiss();
  }

  shareThings(): void {
    this.actionsheetCtrl
      .create({
        cssClass: "action-sheet chatbox-share-things",
        buttons: [
          {
            icon: "pin",
            text: "Location",
            cssClass: "location-icon-color",
            handler: () => {}
          },
          {
            icon: "images",
            text: "Image",
            cssClass: "call-icon-color",
            handler: () => {}
          },
          {
            icon: "film",
            text: "Video",
            cssClass: "video-icon-color",
            handler: () => {}
          },
          {
            icon: "document",
            text: "Document",
            cssClass: "document-icon-color",
            handler: () => {}
          }
        ]
      })
      .present();
  }

  sendMessage(): void {
    if (this.messageId == null) {
      this.getMessageId().then(res => {
        if (res != null) {
          this.addToFb();
        }
      });
    }
    if (this.messageId != null) {
      this.addToFb();
    }
  }

  addToFb(): void {
    this.fdb.database
      .ref("messages")
      .child(this.messageId)
      .push({
        msg: this.messageTextBox
      })
      .catch(err => {
        this.initLoad.loginToFirebase(this.userId);
      });
  }

  getMessageId(): Promise<any> {
    return new Promise((resolve, reject) => {
      let saveData = {
        fromId: this.userId,
        toId: this.toId,
        isactive: true,
        status: true
      };
      this.callchatMessage
        .saveCallChat(saveData)
        .then(res => {
          if (res["responseObject"] != null) {
            this.messageId = res["responseObject"]["id"];
            resolve(this.messageId);
          }
          resolve(null);
        })
        .catch(err => {
          resolve(null);
          this.toast
            .create({
              message: "Something went wrong, please try again after sometime.",
              duration: 2000
            })
            .present();
        });
    });
  }

  ngOnInit(): void {
    this.toId = this.navParams.get("uItem").tuid;
    console.log(this.toId);
    this.call.getValueByKey("userinfo").then(res => {
      this.userId = res.userId;
    });

    this.toUserDetails = {
      img: "assets/img/speakers/duck.jpg",
      name: "Avatar D",
      id: "121212121",
      status: "Online",
      sortname: "Avatar",
      offlineprieod: "30 h"
    };
  }

  userProfile(): void {}

  protected adjustTextarea(event: any): void {
    let textarea: any = event.target;
    textarea.style.overflow = "hidden";
    textarea.style.height = "auto";
    textarea.style.height = textarea.scrollHeight + "px";
    let hgth = textarea.style.height.replace(/px/g, "");
    if (parseInt(hgth) > 76) {
      textarea.style.height = "76px";
      textarea.style.overflow = "auto";
    }
    if (parseInt(hgth) == 46) {
      textarea.style.height = "32px";
    }

    if (textarea.value.length > 1) {
      this.textempty = false;
    } else {
      this.textempty = true;
    }
    return;
  }

  onHold(): void {
    console.log("okk");
  }

  ngAfterContentInit(): void {
    this.bgImage = "assets/img/speakers/duck.jpg";

    this.chatboxbody.nativeElement.style.backgroundImage =
      "url(" + this.bgImage + ")";
    this.chatboxbody.nativeElement.style.backgroundRepeat = "no-repeat";
    this.chatboxbody.nativeElement.style.backgroundSize = "cover";

    this.chatboxbody.nativeElement.style.backgroundAttachment = "fixed";

    this.fdb.database
      .ref("messages")
      .child("7779D0127B3-3C76-4989-805F-95CB139D3787")
      .on("child_added", res => {
        console.log(res);
      });
  }
}
