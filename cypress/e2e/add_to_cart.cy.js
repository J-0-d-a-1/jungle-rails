describe("add_to_cart", () => {
  it("Should increase the number of the cart by one when clicking Add button", () => {
    cy.visit("/");

    cy.get(":nth-child(1) > div > .button_to > .btn").click({ force: true });

    cy.contains("My Cart (1)").should("be.visible");
  });
});
