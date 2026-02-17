import type { HealthResponse } from './contracts';

describe('HealthResponse', () => {
  it('supports the expected health payload shape', () => {
    const payload: HealthResponse = {
      status: 'ok',
      service: 'api',
      timestamp: new Date().toISOString(),
    };

    expect(payload.status).toBe('ok');
    expect(payload.service).toBe('api');
    expect(typeof payload.timestamp).toBe('string');
  });
});
