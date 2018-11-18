import { Component } from '@angular/core';

import { HelloService } from './services/hello.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title: String = 'mini-ng';
  service_result: String = '(not yet called)';

  constructor(protected helloService: HelloService) {
   const self = this;
   helloService.getHello('test101').subscribe( echo => {
     self.service_result = echo;
    });
  }
}
