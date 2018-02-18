// =================
// Edit configs here
// =================

var moveModifier = "cmd,alt";
var moveKeys = {
  "fullScreen": "f",
  "fullScreenNoGap": "g",
  "pushRight": "l",
  "pushLeft": "h",
  "pushUp": "k",
  "pushDown": "j"
};

var focusModifier = "cmd,ctrl";
var focusKeys = {
  "focusRight": "l",
  "focusLeft": "h",
  "focusUp": "k",
  "focusDown": "j"
};

var miscModifier = "cmd,ctrl";
var miscKeys = {
  "hint": "f"
};

var gap = 10;

// =====================================
// Don't touch anything below this line!
// =====================================

function iTermXOffset(win) {
  return win.app().name() == "iTerm2" ? "+ 2" : "";
}

function moveKeystroke(action) {
  return moveKeys[action] + ':' + moveModifier;
}

// Gaps calculation forked and modified from
// https://gist.github.com/leb2/5af57cd4b011937dc6e0/

function moveActionParams(action, win) {
  moveParamsHash = {
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
      "x": "screenSizeX / 2 + " + (gap / 2) + iTermXOffset(win),
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
  };
  return moveParamsHash[action];
}

function moveOperation(win, action) {
  var operation = S.op("move", moveActionParams(action, win));
  win.doOperation(operation);
}

var moveActions = [
  "fullScreen",
  "fullScreenNoGap",
  "pushRight",
  "pushLeft",
  "pushUp",
  "pushDown"
];

_.each(moveActions, function(moveAction) {
  slate.bind(moveKeystroke(moveAction), function(win) { moveOperation(win, moveAction); });
}, this);

function focusKeystroke(action) {
  return focusKeys[action] + ':' + focusModifier;
}

var focusActionParams = {
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
};

function focusOperation(win, action) {
  var operation = S.op("focus", focusActionParams[action]);
  win.doOperation(operation);
}

var focusActions = [
  "focusRight",
  "focusLeft",
  "focusUp",
  "focusDown"
];

_.each(focusActions, function(focusAction) {
  slate.bind(focusKeystroke(focusAction), function(win) { focusOperation(win, focusAction); });
}, this);

slate.bind("f:cmd,shift", function(win) {
    win.doOperation(S.op("hint", {
        "characters": "asdfghjkl"
    }));
});

slate.bind("1:ctrl", S.op("grid", {
  "grids" : {
    "1680x1050": {
      "width": 16,
      "height": 9
    }
  },
  "padding": 5
}));
