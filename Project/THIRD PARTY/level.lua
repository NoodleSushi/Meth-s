return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.18.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 50,
  height = 50,
  tilewidth = 25,
  tileheight = 25,
  nextobjectid = 7,
  properties = {},
  tilesets = {},
  layers = {
    {
      type = "objectgroup",
      name = "Map",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = -25,
      draworder = "topdown",
      properties = {
        ["INNCOLOR"] = "#ffc1d5d5",
        ["LINCOLOR"] = "#ff14c7da",
        ["OUTCOLOR"] = "#ffdbf5f5"
      },
      objects = {
        {
          id = 3,
          name = "Bounds",
          type = "",
          shape = "polygon",
          x = 25,
          y = 150,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 125, y = -150 },
            { x = 325, y = -25 },
            { x = 525, y = -50 },
            { x = 700, y = -125 },
            { x = 1025, y = -125 },
            { x = 1150, y = -50 },
            { x = 1175, y = 150 },
            { x = 1025, y = 225 },
            { x = 1125, y = 275 },
            { x = 1150, y = 350 },
            { x = 1175, y = 750 },
            { x = 1000, y = 900 },
            { x = 625, y = 1050 },
            { x = 250, y = 1000 },
            { x = 275, y = 675 },
            { x = 0, y = 350 },
            { x = 50, y = 175 }
          },
          properties = {}
        },
        {
          id = 4,
          name = "Rock",
          type = "",
          shape = "polygon",
          x = 250,
          y = 275,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 150, y = 25 },
            { x = 150, y = 75 },
            { x = 100, y = 75 },
            { x = 100, y = 50 }
          },
          properties = {}
        },
        {
          id = 5,
          name = "Rock",
          type = "",
          shape = "polygon",
          x = 650,
          y = 475,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = -50, y = 75 },
            { x = 50, y = -25 },
            { x = 50, y = -175 },
            { x = 175, y = -200 },
            { x = 200, y = -25 },
            { x = 150, y = -75 },
            { x = 75, y = 50 }
          },
          properties = {}
        },
        {
          id = 6,
          name = "Rock",
          type = "",
          shape = "polygon",
          x = 600,
          y = 750,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = -25, y = 150 },
            { x = 100, y = 75 },
            { x = 50, y = 200 }
          },
          properties = {}
        }
      }
    }
  }
}
