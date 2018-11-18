import { Component } from '@angular/core';

import { HelloService } from './services/hello.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title: String = 'mini-ng';
  constructor(protected helloService: HelloService) {
   const self = this;
   helloService.getHello('test101').subscribe( echo => {
     self.title = echo;
    });
  }
}
