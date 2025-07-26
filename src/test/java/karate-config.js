function fn() {
  var env = karate.env;
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
    baseUrl: 'https://petstore3.swagger.io/api/v3'
  };

  return config;
}
