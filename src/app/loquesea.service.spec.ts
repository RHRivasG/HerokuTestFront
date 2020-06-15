import { TestBed } from '@angular/core/testing';

import { LoqueseaService } from './loquesea.service';

describe('LoqueseaService', () => {
  let service: LoqueseaService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LoqueseaService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
