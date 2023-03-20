import swaggerJSDoc from 'swagger-jsdoc';

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'My API',
      version: '1.0.0',
      description: 'Description of my API'
    },
    servers: [
      {
        url: 'http://localhost:8000',
        description: 'Development server'
      }
    ]
  },
  apis: ['../routes/*.js'] // đường dẫn tới các file chứa API endpoints
};

const swaggerSpec = swaggerJSDoc(options);

module.exports = swaggerSpec;
