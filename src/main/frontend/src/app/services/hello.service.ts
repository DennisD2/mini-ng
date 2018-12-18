import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class HelloService {

  constructor(protected http:  HttpClient) {
  }

  public getHello(param: string): Observable<string> {
    const serviceUrl = '/mini-ng/rest/echo/' + param;
    console.log('calling service URL ' + serviceUrl);

//    return this.http.get(serviceUrl, {responseType: 'text' as 'json'})
//     .pipe(map((res: string) => res));
    return this.http.get<string>(serviceUrl, {responseType: 'text' as 'json'})
    .pipe(catchError((e: any) => this.handleError(e)));
  }
  protected handleError(error: any): Promise<any> {
    console.error('An error occurred', error);
    // return Promise.reject(error.message || error);
    return Promise.resolve('call failed (status=' + error.status + ', message=' + error.message + ')');
  }

}
