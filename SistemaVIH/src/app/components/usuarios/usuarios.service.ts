import { Injectable } from '@angular/core';
/* import { USUARIOS } from './usuaris.json'; */
import { Usuarios } from './usuarios.class';
import { of, Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http'

@Injectable()
export class UsuariosService {

  private url:string = 'http://localhost:8080/api/usuarios';

  constructor(private http: HttpClient) { }

  getUsuarios(): Observable<Usuarios[]> {
    //return of(USUARIOS);
    return this.http.get<Usuarios[]>(this.url);
  }
}
