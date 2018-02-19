// =================
// Edit configs here
// =================

var bindings = {
  "move": {
    "modifier": "cmd,alt",
    "keys": {
      "fullScreen": "f",
      "fullScreenNoGap": "g",
      "pushRight": "l",
      "pushLeft": "h",
      "pushUp": "k",
      "pushDown": "j"
    }
  },
  "focus": {
    "modifier": "cmd,ctrl",
    "keys": {
      "focusRight": "l",
      "focusLeft": "h",
      "focusUp": "k",
      "focusDown": "j"
    }
  },
  "hint": {
    "modifier": "cmd,ctrl",
    "keys": {
      "hint": "f"
    }
  },
  "grid": {
    "modifier": "cmd,ctrl",
    "keys": {
      "grid": "g"
    }
  }
};

var gap = 10;

// =====================================
// Don't touch anything below this line!
// =====================================

function iTermXOffset(win) {
  return win.app().name() == "iTerm2" ? "+ 2" : "";
}

function keystroke(operation, action) {
  var operationHash = bindings[operation]
  var modifier = operationHash["modifier"]
  var key = operationHash["keys"][action]
  return key + ":" + modifier;
}

// Gaps calculation forked and modified from
// https://gist.github.com/leb2/5af57cd4b011937dc6e0/

function operationParams(operation, action, win) {
  paramsHash = {
    "move": {
      "fullScreen": {
        "x": "screenOriginX + " + gap + iTermXOffset(win),
        "y": "screenOriginY + " + gap,
        "width": "screenSizeX - " + (gap * 2),
        "height": "screenSizeY - " + (gap * 2)
      },
      "fullScreenNoGap": {
        "x": "screenOriginX",
        "y": "screenOriginY",
        "width": "screenSizeX",
        "height": "screenSizeY"
      },
      "pushRight": {
        "x": "screenOriginX + (screenSizeX / 2) + " + (gap / 2) + iTermXOffset(win),
        "y": "screenOriginY + " + gap,
        "width": "screenSizeX / 2 - " + (gap * 3 / 2),
        "height": "screenSizeY - " + (gap * 2)
      },
      "pushLeft": {
        "x": "screenOriginX + " + gap + iTermXOffset(win),
        "y": "screenOriginY + " + gap,
        "width": "screenSizeX / 2 - " + (gap * 3 / 2),
        "height": "screenSizeY - " + (gap * 2)
      },
      "pushDown": {
        "x": "windowTopLeftX",
        "y": "screenSizeY / 2 + " + (gap / 2),
        "height": "screenSizeY / 2 -" + (3 * gap / 2),
        "width": "windowSizeX"
      },
      "pushUp": {
        "x": "windowTopLeftX",
        "y": gap,
        "height": "screenSizeY / 2 -" + (3 * gap / 2),
        "width": "windowSizeX"
      },
    },
    "focus": {
      "focusRight": {
        "direction": "right"
      },
      "focusLeft": {
        "direction": "left"
      },
      "focusUp": {
        "direction": "up"
      },
      "focusDown": {
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
  return paramsHash[operation][action];
}

function doOperation(win, operation, action) {
  var operation = S.op(operation, operationParams(operation, action, win));
  win.doOperation(operation);
}

var operationActionHashes = [
  {
    "operation": "move",
    "actions": [
      "fullScreen",
      "fullScreenNoGap",
      "pushRight",
      "pushLeft",
      "pushUp",
      "pushDown"
    ]
  },
  {
    "operation": "focus",
    "actions": [
      "focusRight",
      "focusLeft",
      "focusUp",
      "focusDown"
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
  var operation = operationActionHash["operation"];
  _.each(operationActionHash["actions"], function(action) {
    S.bind(keystroke(operation, action), function(win) {
      doOperation(win, operation, action);
    });
  }, this);
}, this);
