import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';

import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class HelloService {

  constructor(protected http:  HttpClient) {
  }

  public getHello(param: string): Observable<string> {
    console.log('get');
    const serviceUrl = 'http://localhost:8080/mini-ng/rest/echo/' + param;

//    return this.http.get(serviceUrl, {responseType: 'text' as 'json'})
//     .pipe(map((res: string) => res));
    return this.http.get<string>(serviceUrl, {responseType: 'text' as 'json'});
  }
  protected handleError(error: any): Promise<any> {
    console.error('An error occurred', error);
    return Promise.reject(error.message || error);
  }

}
