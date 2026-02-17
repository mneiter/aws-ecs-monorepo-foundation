import type { HealthResponse } from '@foundation/contracts';
import { buildApp } from './server';

describe('GET /api/health', () => {
  it('returns 200 with the expected payload shape', async () => {
    const app = buildApp();

    const response = await app.inject({
      method: 'GET',
      url: '/api/health',
    });

    expect(response.statusCode).toBe(200);

    const body = response.json() as HealthResponse;
    expect(body.status).toBe('ok');
    expect(body.service).toBe('api');
    expect(typeof body.timestamp).toBe('string');

    await app.close();
  });
});
