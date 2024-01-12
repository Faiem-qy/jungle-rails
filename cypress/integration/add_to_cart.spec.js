describe('Product Detail Page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/');
  });

  it('should display a list of products', () => {
    // Login
    cy.visit('http://localhost:3000/login');
    cy.get('input[name="session[email]"]').type('a@a.com');
    cy.get('input[name="session[password]"]').type('1');
    cy.get('input[type="submit"]').click();
    // Ensure successful login
    cy.url().should('include', '/');
    // Click on the first 'article' element on the page
    cy.get('article').first().click();
    // Check if the '.product-detail' element exists on the page
    cy.get('.product-detail').should('exist');
    // Check if the current URL includes products
    cy.url().should('include', '/products/');
    // Click the "Add" button to add the item to the cart
    cy.get('.product-detail .btn').click({ force: true }); 
        // Confirm that the cart count has increased
    cy.contains('My Cart (1)').should('exist'); 
  });
});
