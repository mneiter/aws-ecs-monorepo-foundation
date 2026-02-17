import { render, screen } from '@testing-library/react';
import Page from '../src/app/page';

describe('web index page', () => {
  it('renders the foundation title', () => {
    render(<Page />);
    expect(screen.getByText('aws-ecs-monorepo-foundation')).toBeTruthy();
  });
});
