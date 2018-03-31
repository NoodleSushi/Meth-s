return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 50,
  height = 50,
  tilewidth = 50,
  tileheight = 50,
  nextobjectid = 47,
  properties = {},
  tilesets = {},
  layers = {
    {
      type = "objectgroup",
      name = "Map",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {
        ["INNCOLOR"] = "#ff55ff00",
        ["LINCOLOR"] = "#ff55ff00",
        ["OUTCOLOR"] = "#ff55ce22"
      },
      objects = {
        {
          id = 5,
          name = "Bounds",
          type = "",
          shape = "polygon",
          x = 450,
          y = 200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 750, y = 0 },
            { x = 1250, y = 200 },
            { x = 1700, y = 50 },
            { x = 1950, y = 300 },
            { x = 1950, y = 800 },
            { x = 1600, y = 900 },
            { x = 1700, y = 1250 },
            { x = 1850, y = 1300 },
            { x = 1900, y = 1550 },
            { x = 1800, y = 1700 },
            { x = 1450, y = 1800 },
            { x = 1100, y = 1750 },
            { x = 1050, y = 2050 },
            { x = 1600, y = 2150 },
            { x = 2000, y = 2050 },
            { x = 1500, y = 2250 },
            { x = 750, y = 2200 },
            { x = 100, y = 2050 },
            { x = 100, y = 1700 },
            { x = 300, y = 1500 },
            { x = 250, y = 1150 },
            { x = -300, y = 1200 },
            { x = -150, y = 1550 },
            { x = -450, y = 1400 },
            { x = -400, y = 800 },
            { x = -300, y = 250 },
            { x = 50, y = 300 },
            { x = 500, y = 250 },
            { x = 700, y = 400 },
            { x = 800, y = 150 }
          },
          properties = {}
        },
        {
          id = 6,
          name = "Rock",
          type = "",
          shape = "polygon",
          x = 1400,
          y = 900,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 300, y = -150 },
            { x = 350, y = 50 },
            { x = 100, y = 50 },
            { x = 150, y = 0 }
          },
          properties = {}
        },
        {
          id = 7,
          name = "Rock",
          type = "",
          shape = "polygon",
          x = 600,
          y = 850,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 300, y = 50 },
            { x = 250, y = 150 },
            { x = -100, y = 150 },
            { x = -350, y = 50 },
            { x = -50, y = 100 }
          },
          properties = {}
        },
        {
          id = 8,
          name = "Rock",
          type = "",
          shape = "polygon",
          x = 1200,
          y = 1400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 350, y = -100 },
            { x = 50, y = -350 },
            { x = 150, y = -150 }
          },
          properties = {}
        },
        {
          id = 9,
          name = "Rock",
          type = "",
          shape = "polygon",
          x = 850,
          y = 1850,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 300, y = 150 },
            { x = 100, y = 200 }
          },
          properties = {}
        },
        {
          id = 11,
          name = "Player",
          type = "",
          shape = "ellipse",
          x = 400,
          y = 600,
          width = 100,
          height = 100,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Colliders",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 17,
          name = "",
          type = "",
          shape = "polygon",
          x = 450,
          y = 200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 800, y = 150 },
            { x = 700, y = 400 },
            { x = 500, y = 250 },
            { x = 50, y = 300 },
            { x = -300, y = 250 }
          },
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "polygon",
          x = 150,
          y = 450,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -200, y = 500 },
            { x = -150, y = 1150 },
            { x = -100, y = 550 }
          },
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "polygon",
          x = 0,
          y = 1600,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 300, y = 150 },
            { x = 150, y = -200 },
            { x = 700, y = -250 },
            { x = 750, y = 100 },
            { x = 550, y = 300 },
            { x = 550, y = 650 }
          },
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "polygon",
          x = 550,
          y = 2250,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 300, y = 250 },
            { x = 1400, y = 250 },
            { x = 1400, y = 200 },
            { x = 650, y = 150 }
          },
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "polygon",
          x = 1950,
          y = 2450,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 550, y = 50 },
            { x = 500, y = -200 }
          },
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "polygon",
          x = 2450,
          y = 2250,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -200, y = -350 },
            { x = -550, y = -250 },
            { x = -900, y = -300 },
            { x = -950, y = 0 },
            { x = -400, y = 100 }
          },
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "polygon",
          x = 2300,
          y = 1500,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 150, y = 0 },
            { x = 150, y = 750 },
            { x = -50, y = 400 },
            { x = 50, y = 250 }
          },
          properties = {}
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "polygon",
          x = 2450,
          y = 1500,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -50, y = -500 },
            { x = -400, y = -400 },
            { x = -300, y = -50 },
            { x = -150, y = 0 }
          },
          properties = {}
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "polygon",
          x = 2400,
          y = 1000,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 100, y = -500 },
            { x = -250, y = -750 },
            { x = 0, y = -500 }
          },
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "",
          shape = "polygon",
          x = 2150,
          y = 250,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -450, y = 150 },
            { x = -950, y = -50 },
            { x = -1200, y = -50 },
            { x = -1300, y = 100 },
            { x = -1700, y = -50 },
            { x = -1000, y = -200 }
          },
          properties = {}
        }
      }
    }
  }
}
