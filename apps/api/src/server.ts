import Fastify, { FastifyInstance } from 'fastify';
import type { HealthResponse } from '@foundation/contracts';

export function buildApp(): FastifyInstance {
  const app = Fastify({ logger: true });

  app.get('/api/health', async (): Promise<HealthResponse> => {
    return {
      status: 'ok',
      service: 'api',
      timestamp: new Date().toISOString(),
    };
  });

  app.get('/', async () => {
    return {
      message: 'api service is running',
    };
  });

  return app;
}
