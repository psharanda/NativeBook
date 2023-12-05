import * as fs from "fs";
import * as ejs from "ejs";

const repoRoot = __dirname + "/../../";
const siteDir = repoRoot + "native_book_site";

interface Config {
  components: { name: string; storySetFile: string; snapshotsFolder: string }[];
}

interface Story {
  name: string;
  snippet: string;
}

interface Component {
  name: string;
  stories: Story[];
  snapshotsFolder: string;
}

function formatMultilineString(input: string): string {
  let lines = input.split("\n");

  while (lines.length > 0 && lines[0].trim() === "") {
    lines.shift();
  }
  while (lines.length > 0 && lines[lines.length - 1].trim() === "") {
    lines.pop();
  }

  let minLeadingSpaces = lines.reduce((min, line) => {
    if (line.trim() === "") {
      return min;
    }
    const leadingSpaces = line.search(/\S|$/);
    return Math.min(min, leadingSpaces);
  }, Infinity);

  if (minLeadingSpaces !== Infinity) {
    lines = lines.map((line) => line.substring(minLeadingSpaces));
  }
  return lines.join("\n");
}

function snippetsFromFile(
  filePath: string
): { name: string; snippet: string }[] {
  const sourceCode = fs.readFileSync(repoRoot + filePath, "utf-8");

  const snippetRegex =
    /@objc\s+func\s+snippet_(?<name>[A-Za-z0-9_]+)\(\)\s*->\s*UIView\s*{(?<snippet>[\s\S]*?)return/g;

  const result: { name: string; snippet: string }[] = [];
  let match;
  while ((match = snippetRegex.exec(sourceCode)) !== null && match.groups) {
    result.push({
      name: match.groups["name"],
      snippet: formatMultilineString(match.groups["snippet"]),
    });
  }

  return result;
}

function renderIndex(components: Component[]) {
  fs.writeFileSync(
    siteDir + "/index.html",
    ejs.render(
      fs.readFileSync(__dirname + "/templates/index.html.ejs", "utf-8"),
      {
        components: components,
      }
    )
  );
}

function renderComponent(component: Component) {
  fs.writeFileSync(
    siteDir + `/${component.name}.html`,
    ejs.render(
      fs.readFileSync(__dirname + "/templates/component.html.ejs", "utf-8"),
      {
        component: component,
      }
    )
  );
}

(async function () {
  // load config
  const nativeBookConfigContents = fs.readFileSync(
    repoRoot + "native_book_config.json",
    "utf-8"
  );

  const config = JSON.parse(nativeBookConfigContents) as Config;

  // gather information for a component
  const components: Component[] = [];
  for (const componentJson of config.components) {
    const component: Component = {
      name: componentJson.name,
      stories: [],
      snapshotsFolder: componentJson.snapshotsFolder,
    };
    // extract code snippets for a component
    const snippets = snippetsFromFile(componentJson.storySetFile);

    for (const snippet of snippets) {
      component.stories.push({
        name: snippet.name,
        snippet: snippet.snippet,
      });
    }

    components.push(component);
  }

  // prepare site folder
  if (fs.existsSync(siteDir)) {
    fs.rmSync(siteDir, { recursive: true });
  }

  fs.mkdirSync(siteDir, { recursive: true });

  // render html site
  renderIndex(components);
  for (const component of components) {
    renderComponent(component);
  }
})();