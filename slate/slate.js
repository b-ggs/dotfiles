// ===========
// Keybindings
// ===========

var direction = {
  "left": "h",
  "right": "l",
  "up": "k",
  "down": "j"
};

var bindings = {
  "move": {
    "modifier": "cmd,alt",
    "keys": {
      "fullScreen": "f",
      "fullScreenNoGap": "r",
      "left": direction.left,
      "right": direction.right,
      "up": direction.up,
      "down": direction.down
    }
  },
  "focus": {
    "modifier": "cmd,ctrl",
    "keys": {
      "left": direction.left,
      "right": direction.right,
      "up": direction.up,
      "down": direction.down
    }
  },
  "hint": {
    "modifier": "cmd,alt",
    "keys": {
      "hint": "g"
    }
  },
  "grid": {
    "modifier": "cmd,ctrl",
    "keys": {
      "grid": "g"
    }
  }
};

// =======
// Offsets
// =======

var gap = 10;
var offsets = {
  "top": 0,
  "bottom": 0
};

// =====================================
// Don't touch anything below this line!
// =====================================

function keystroke(operation, action) {
  var operationHash = bindings[operation];
  var modifier = operationHash.modifier;
  var key = operationHash.keys[action];
  return key + ":" + modifier;
}

// Gaps calculation forked and modified from
// https://gist.github.com/leb2/5af57cd4b011937dc6e0/

var operationParams = {
  "move": {
    "fullScreen": {
      "x": `screenOriginX + ${gap}`,
      "y": `screenOriginY + ${gap} + ${offsets.top}`,
      "width": `screenSizeX - ${gap * 2}`,
      "height": `screenSizeY - ${gap * 2} - ${offsets.top} - ${offsets.bottom}`
    },
    "fullScreenNoGap": {
      "x": "screenOriginX",
      "y": "screenOriginY",
      "width": "screenSizeX",
      "height": "screenSizeY"
    },
    "right": {
      "x": `screenOriginX + (screenSizeX / 2) + ${gap / 2}`,
      "y": `screenOriginY + ${gap} + ${offsets.top}`,
      "width": `(screenSizeX / 2) - ${gap * 3 / 2}`,
      "height": `screenSizeY - ${gap * 2} - ${offsets.top} - ${offsets.bottom}`
    },
    "left": {
      "x": `screenOriginX + ${gap}`,
      "y": `screenOriginY + ${gap} + ${offsets.top}`,
      "width": `(screenSizeX / 2) - ${gap * 3 / 2}`,
      "height": `screenSizeY - ${gap * 2} - ${offsets.top} - ${offsets.bottom}`
    },
    "up": {
      "x": "windowTopLeftX",
      "y": `screenOriginY + ${gap} + ${offsets.top}`,
      "height": `(screenSizeY / 2) - ${gap * 3 / 2} - ${offsets.top / 2} - ${offsets.bottom / 2}`,
      "width": "windowSizeX"
    },
    "down": {
      "x": "windowTopLeftX",
      "y": `screenOriginY + (screenSizeY / 2) + ${gap / 2} + ${offsets.top / 2} - ${offsets.bottom / 2}`,
      "height": `(screenSizeY / 2) - ${gap * 3 / 2} - ${offsets.top / 2} - ${offsets.bottom / 2}`,
      "width": "windowSizeX"
    }
  },
  "focus": {
    "right": {
      "direction": "right"
    },
    "left": {
      "direction": "left"
    },
    "up": {
      "direction": "up"
    },
    "down": {
      "direction": "down"
    }
  },
  "hint": {
    "hint": {
      "characters": "asdfghjkl"
    }
  },
  "grid": {
    "grid": {
      "grids": {
        "1680x1050": {
          "width": 16,
          "height": 9
        }
      },
      "padding": 5
    }
  }
};

function doOperation(win, operation, action) {
  var windowOperation = S.op(operation, operationParams[operation][action]);
  win.doOperation(windowOperation);
}

var operationActionHashes = [
  {
    "operation": "move",
    "actions": [
      "fullScreen",
      "fullScreenNoGap",
      "left",
      "right",
      "up",
      "down"
    ]
  },
  {
    "operation": "focus",
    "actions": [
      "left",
      "right",
      "up",
      "down"
    ]
  },
  {
    "operation": "hint",
    "actions": [
      "hint"
    ]
  },
  {
    "operation": "grid",
    "actions": [
      "grid"
    ]
  }
];

_.each(operationActionHashes, function(operationActionHash) {
  var operation = operationActionHash.operation;
  _.each(operationActionHash.actions, function(action) {
    S.bind(keystroke(operation, action), function(win) {
      doOperation(win, operation, action);
    });
  }, this);
}, this);
