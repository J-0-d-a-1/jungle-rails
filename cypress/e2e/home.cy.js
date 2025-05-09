describe("homepage", () => {
  it("Should visit the homepage", () => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });
});
