import { Component, OnInit } from '@angular/core';
import { Usuarios } from './usuarios.class';
import { UsuariosService } from './usuarios.service';


@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.component.html',
  styleUrls: ['./usuarios.component.css']
})
export class UsuariosComponent implements OnInit {

  usuarios: Usuarios[];

  /* Para injectar las dependecias se usa usuarios.service y se declaran algunos atributos en el constructor */
  constructor(private usuarios_service: UsuariosService) { }

  ngOnInit(): void {
    /* Como ya se tiene un atributo que hace referencia a usuarios.service entonces ya
       entonces ya se pueden obtener los metodos que ofrece eser servicio. */
    this.usuarios_service.getUsuarios().subscribe(
      usuarios => this.usuarios = usuarios
    );
  }

}
