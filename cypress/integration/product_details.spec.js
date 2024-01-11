
it('should display a list of products', () => {
  cy.visit('http://localhost:3000/');
  cy.get('.products article').should("have.length.gt", 10);
});
