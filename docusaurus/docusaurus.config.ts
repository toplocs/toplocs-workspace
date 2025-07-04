import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

const config: Config = {
  title: 'TopLocs Documentation',
  tagline: 'Decentralized P2P Community Platform',
  favicon: 'img/favicon.ico',

  // Future flags, see https://docusaurus.io/docs/api/docusaurus-config#future
  future: {
    v4: true, // Improve compatibility with the upcoming Docusaurus v4
  },

  // Set the production url of your site here
  url: 'https://toplocs.github.io',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/toplocs-workspace/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'toplocs', // Usually your GitHub org/user name.
  projectName: 'toplocs-workspace', // Usually your repo name.

  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          id: 'workspace',
          path: '../docs',
          routeBasePath: 'docs',
          sidebarPath: './sidebars.ts',
          editUrl:
            'https://github.com/toplocs/toplocs-workspace/blob/main/docs/',
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  plugins: [
    [
      '@docusaurus/plugin-content-docs',
      {
        id: 'tribelike',
        path: '../tribelike/docs',
        routeBasePath: 'tribelike',
        sidebarPath: './sidebars.ts',
        editUrl: ({ docPath }) => {
          // Remove the 'tribelike/' prefix that gets added
          const cleanPath = docPath.replace(/^tribelike\//, '');
          return `https://github.com/toplocs/tribelike/blob/main/docs/${cleanPath}`;
        },
      },
    ],
  ],

  themeConfig: {
    // Replace with your project's social card
    image: 'img/docusaurus-social-card.jpg',
    navbar: {
      title: 'TopLocs',
      logo: {
        alt: 'TopLocs Logo',
        src: 'img/toplocs-logo.png',
        width: 32,
        height: 32,
      },
      items: [
        {
          type: 'docSidebar',
          docsPluginId: 'workspace',
          sidebarId: 'tutorialSidebar',
          position: 'left',
          label: 'Workspace',
        },
        {
          type: 'docSidebar',
          docsPluginId: 'tribelike',
          sidebarId: 'tutorialSidebar',
          position: 'left',
          label: 'Core Platform',
        },
        {
          href: 'https://github.com/toplocs',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Docs',
          items: [
            {
              label: 'Getting Started',
              to: '/docs/workspace/getting-started',
            },
            {
              label: 'Architecture',
              to: '/docs/project/architecture',
            },
            {
              label: 'Core Platform',
              to: '/tribelike/getting-started',
            },
          ],
        },
        {
          title: 'Community',
          items: [
            {
              label: 'GitHub',
              href: 'https://github.com/toplocs',
            },
          ],
        },
        {
          title: 'More',
          items: [
            {
              label: 'Ecosystem Overview',
              to: '/docs/project/ecosystem',
            },
            {
              label: 'Plugin Development',
              to: '/docs/development/plugin-development',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} TopLocs. Built with Docusaurus.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;