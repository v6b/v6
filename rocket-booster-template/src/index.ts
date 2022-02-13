import useProxy from 'rocket-booster';

addEventListener('fetch', (event) => {
  const proxy = useProxy();
  proxy.use('/', {
    upstream: {
      domain: 'httpbin.org',
      protocol: 'https',
    },

    firewall: [
      {
        field: 'country',
        operator: 'in',
        value: ['CN', 'KP', 'SY', 'PK', 'CU'],
      },
    ],
  });

  const response = proxy.apply(event.request);
  event.respondWith(response);
});
