import { RouterModule, Routes } from '@angular/router';

import { InicioComponent } from './components/inicio/inicio.component';
import { LoginComponent } from './components/login/login.component';
import { UsuariosComponent } from './components/usuarios/usuarios.component';

const APP_RUTAS: Routes = [
    { path: 'inicio', component: InicioComponent},
    { path: 'login', component: LoginComponent},
    { path: 'usuarios', component:UsuariosComponent},
    { path: '', pathMatch: 'full', redirectTo: '/inicio'}
];

export const APP_ROUTING = RouterModule.forRoot(APP_RUTAS);
