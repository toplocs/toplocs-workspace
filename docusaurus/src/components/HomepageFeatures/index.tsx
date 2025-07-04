import type {ReactNode} from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: ReactNode;
  link: string;
  linkText: string;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Quick Setup',
    Svg: require('@site/static/img/undraw_mobile-interface_z1b3.svg').default,
    description: (
      <>
        Get your TopLocs ecosystem up and running in minutes with our AI-powered setup. 
        Clone, configure, and start building decentralized communities instantly.
      </>
    ),
    link: '/docs/workspace/getting-started',
    linkText: 'Start Building →',
  },
  {
    title: 'P2P Network',
    Svg: require('@site/static/img/undraw_connected-world_anke.svg').default,
    description: (
      <>
        Built on Gun.js, TopLocs offers true peer-to-peer connectivity. 
        No central servers, user-owned data, and real-time synchronization.
      </>
    ),
    link: '/docs/project/architecture',
    linkText: 'Learn More →',
  },
  {
    title: 'Open Development',
    Svg: require('@site/static/img/undraw_developer-activity_4zqd.svg').default,
    description: (
      <>
        Join our community! Contribute to the platform, create plugins, 
        or help shape the future of decentralized social networks.
      </>
    ),
    link: 'https://github.com/toplocs',
    linkText: 'View on GitHub →',
  },
];

function Feature({title, Svg, description, link, linkText}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
        <div className={styles.buttons}>
          <Link
            className="button button--secondary button--lg"
            to={link}>
            {linkText}
          </Link>
        </div>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): ReactNode {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}