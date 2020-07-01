import { Component, OnInit } from "@angular/core";
import { Loquesea } from "./interfaces/loquesea-interface";
import { LoqueseaService } from "./loquesea.service";

@Component({
    selector: "app-root",
    templateUrl: "./app.component.html",
    styleUrls: ["./app.component.css"],
})
export class AppComponent implements OnInit {
    title = "example";
    loquesea: Loquesea[] = [];
    constructor(private loqueseaService: LoqueseaService) { }

    ngOnInit(): void {
        this.getLoquesea();
    }

    getLoquesea() {
        this.loqueseaService.getLoquesea().subscribe(
            (res) => {
                this.loquesea = res
                window.alert(res.values)
            },
            (err) => {
                console.log(err)
            }
        );
    }
}
