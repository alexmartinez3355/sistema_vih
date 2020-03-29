import { RouterModule, Routes } from '@angular/router';

import { InicioComponent } from './components/inicio/inicio.component';
import { LoginComponent } from './components/usuarios/login.component';

const APP_RUTAS: Routes = [
    { path: 'inicio', component: InicioComponent},
    { path: 'login', component: LoginComponent},
    { path: '**', pathMatch: 'full', redirectTo: 'inicio'}
];

export const APP_ROUTING = RouterModule.forRoot(APP_RUTAS);
