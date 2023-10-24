import type { Config } from "@jest/types";

const config: Config.InitialOptions = {
  moduleFileExtensions: ["js", "ts", "json"],
  transform: {
    "^.+\\.ts$": "ts-jest",
  },
  testEnvironment: "jsdom",
  testPathIgnorePatterns: ["<rootDir>/tests/e2e"],
  setupFilesAfterEnv: ["<rootDir>/tests/jest.setup.ts"],
  collectCoverageFrom: ["src/**", "!**/*.d.ts"],
};

export default config;
