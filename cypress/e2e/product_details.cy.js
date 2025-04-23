describe("product_details", () => {
  it("Can see the detail of product on detail page when click each product", () => {
    cy.visit("/");

    cy.get(".products > :nth-child(1)").click();

    cy.contains("Add").should("be.visible");
    cy.get(".main-img").should("exist");
    cy.contains("Scented Blade").should("be.visible");
    cy.get(":nth-child(2) > p").should("exist");
    cy.get(".quantity").should("exist");
    cy.get(".price").should("exist");
  });
});
