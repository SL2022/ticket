/// <reference types="cypress" />

context('Misc', () => {
  beforeEach(() => {
    cy.visit('http://localhost:4000/test_workbench')
  })

  it('test AlpineJS working', () => {
    cy.get('.alpine_test').within(() => {
      cy.get('button').click()
      cy.contains('Drop')
    })
  })
})
