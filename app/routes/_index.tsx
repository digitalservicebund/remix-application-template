import type { MetaFunction } from "@remix-run/node";

export const meta: MetaFunction = () => {
  return [
    { title: "Remix Application Template" },
    { name: "description", content: "Hello DigitalService!" },
  ];
};

export default function Index() {
  return (
    <div>
      <h1 className={"heading-01-reg"}>Hello DigitalService!</h1>
      <button className="ds-button ds-button-large">
        <span className="ds-button-label">Click me for nothing</span>
      </button>
    </div>
  );
}
