import './global.css';

export const metadata = {
  title: 'aws-ecs-monorepo-foundation',
  description: 'Static web app for ECS Fargate foundation',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
