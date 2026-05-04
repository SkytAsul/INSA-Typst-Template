#import "/src/insa-common.typ": *

// Tests for insa-logo-path function
#assert.eq(insa-logo-path("cvl"), "assets/cvl/logo.svg")
#assert.eq(insa-logo-path("hdf"), "assets/hdf/logo.png")
#assert.eq(insa-logo-path("rennes"), "assets/rennes/logo.png")

#assert-panic(() => insa-logo-path("baguette"))

// Tests for insa-school-name function
#assert.eq(insa-school-name("cvl"), "Centre Val de Loire")
#assert.eq(insa-school-name("hdf"), "Hauts-de-France")
#assert.eq(insa-school-name("rennes"), "Rennes")

#assert-panic(() => insa-school-name("baguette"))
