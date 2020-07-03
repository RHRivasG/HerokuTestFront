import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HostedComponent } from './hosted/hosted.component';


const routes: Routes = [
  {path: "hosted", component: HostedComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
