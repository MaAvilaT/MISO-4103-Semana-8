class LoginPage {

    fillEmailAddress(email) {
        cy.get('input[type="email"]').type(email);
    }

    fillPassword(password) {
        cy.get('input[type="password"]').type(password);
    }

    submitLogin() {
        cy.get('button[type="submit"]').click();
    }

    isFormInFailureState() {
        cy.get('[data-test-task-button-state="failure"]').should('exist')
    }

    mainErrorContainesMessage(message) {
        cy.get('p[class="main-error"]').should('contain', message)
    }
}

export const loginPage = new LoginPage();