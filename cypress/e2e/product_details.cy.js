describe("product_details", () => {
  before(() => {
    cy.visit("/");

    cy.get(".products > :nth-child(1)").click();
  });

  it("Can see the detail of product on detail page when click each product", () => {
    cy.contains("Add");
    cy.get(".main-img").should("exist");
    cy.contains("Scented Blade");
    cy.get(":nth-child(2) > p").should("exist");
    cy.get(".quantity").should("exist");
    cy.get(".price").should("exist");
  });
});
