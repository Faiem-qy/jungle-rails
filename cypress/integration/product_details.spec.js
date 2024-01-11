
describe('Product Detail Page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/');
  });

  it('should display a list of products', () => {
    cy.get('article').first().click();
    cy.get('.product-detail').should('exist');
    cy.url().should('include', '/products/');
  });
})

