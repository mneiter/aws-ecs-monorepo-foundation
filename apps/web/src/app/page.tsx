import type { HealthResponse } from '@foundation/contracts';

const sampleHealth: HealthResponse = {
  status: 'ok',
  service: 'api',
  timestamp: new Date(0).toISOString(),
};

export default function IndexPage() {
  return (
    <main>
      <h1>aws-ecs-monorepo-foundation</h1>
      <p>Static Next.js web app served by nginx.</p>
      <p>
        API health endpoint: <code>/api/health</code>
      </p>
      <pre>{JSON.stringify(sampleHealth, null, 2)}</pre>
    </main>
  );
}
