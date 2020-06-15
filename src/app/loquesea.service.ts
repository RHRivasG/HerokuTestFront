import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Loquesea } from "./interfaces/loquesea-interface";
import { Observable } from "rxjs";

@Injectable({
  providedIn: "root",
})
export class LoqueseaService {
    constructor(private httpClient: HttpClient) {}
    BASE_URL: string = "/api";

    getLoquesea(): Observable<Loquesea[]> {
	return this.httpClient.get<Loquesea[]>(`${this.BASE_URL}`);
    }
}
