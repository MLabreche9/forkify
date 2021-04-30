var _modelJs = require('./model.js');
var _viewsRecipeViewJs = require('./views/recipeView.js');
var _parcelHelpers = require("@parcel/transformer-js/lib/esmodule-helpers.js");
var _viewsRecipeViewJsDefault = _parcelHelpers.interopDefault(_viewsRecipeViewJs);
require('core-js/stable');
require('regenerator-runtime/runtime');
const recipeContainer = document.querySelector('.recipe');
const timeout = function (s) {
  return new Promise(function (_, reject) {
    setTimeout(function () {
      reject(new Error(`Request took too long! Timeout after ${s} second`));
    }, s * 1000);
  });
};
// https://forkify-api.herokuapp.com/v2
// /////////////////////////////////////
const controlRecipes = async function () {
  try {
    const id = window.location.hash.slice(1);
    lo;
    if (!id) return;
    _viewsRecipeViewJsDefault.default.renderSpinner();
    // 1) loading recipe
    await _modelJs.loadRecipe(id);
    // 2) Rendering recipe
    _viewsRecipeViewJsDefault.default.render(_modelJs.state.recipe);
  } catch (err) {
    alert(err);
  }
};
['hashchange', 'load'].forEach(ev => window.addEventListener(ev, controlRecipes));
